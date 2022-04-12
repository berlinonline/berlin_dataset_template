# Makefile to automate various administration tasks related to
# dataset repositories

# extract some values from the ckan_updater config
license_id = `jq -r '.dataset.license_id' conf/ckan_updater.json`
ckan_base = `jq -r '.connection.ckan_base' conf/ckan_updater.json`
license_def = $(ckan_base)/licenses/berlin-od-portal.json
config_location = conf/ckan_updater.json

# rename the original README.md to admin.md to keep it in the new repository
.PHONY: admin.md
admin.md:
	@echo "generating $@ ..."
	@mv README.md $@

# create the real new README
README.md: temp/README.md admin.md
	@echo "generating $@ from $< ..."
	@cp $< $@

# create a new README in temp based on the template and the config file
temp/README.md: temp/ckan_updater.json
	@echo "generating $@ ..."
	@j2 README.template.md $< > $@

# download the license definition file, make each license accesible 
# by its id
temp/licenses.json: temp
	@echo "getting license list from $(license_def) ..."
	@curl -s $(license_def) | jq 'map( { (.id): . } ) | add' > $@

# extract the details of the license specified in config
temp/license_details.json: temp/licenses.json
	@echo "writing license details to $@ ..."
	@jq --arg license_id "$(license_id)" '.[$$license_id] | { dataset: { license_title: .title, license_url: .url } }' $< > $@

# merge config with license details into an updated config
temp/ckan_updater.json: temp/license_details.json
	@echo "merging $@ and $< ..."
	@jq -s '.[0] * .[1]' $(config_location) $< > $@


# housekeeping
clean: clean-temp

clean-temp:
	@echo "deleting temp folder ..."
	@rm -rf temp

temp:
	@echo "creating temp directory ..."
	@mkdir -p temp

