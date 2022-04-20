# Berlin Dataset Template

![Berlin-Open-Data-Logo vor stilisierter Landkarte von Berlin](images/twitter_card_fallback_small.jpg)

This repository can be used as a template for new datasets for [Berlin Open Data](https://daten.berlin.de "The official Open Data portal of Berlin"), the official Open Data portal of the city of Berlin.
While the data portal is exclusively a metadata portal, repositories created on the basis of this template are meant to hold the actual data of a dataset.

The template provides a number of elements that are common to all datasets, as well as some code for the automation of common tasks:

- a `README.md` file with basic information about the dataset
- a [data](data) folder as the default location for the actual data files
- metadata for the dataset and other configuration in the [conf](conf) folder
- a [Makefile](Makefile) to help automate certain administration tasks
- [workflows](.github) that will trigger these tasks under certain conditions:
  - initialising the new dataset repository when the metadata in [conf/updater.json](conf/updater.json) is changed for the first time
  - updating the dataset's metadata in [Berlin Open Data](https://daten.berlin.de "The official Open Data portal of Berlin") each time the [data](data) is changed

## Using the Template

To create a new dataset repository from this template, follow the these steps:

- Click the green <a href="../../generate">**Use this template**</a> button right below the main navigation.
- Enter the repository name and description. Make sure the repository is **public** and the **Include all branches** check box is not ticked!
- Once the new repository is created, create a new repository secret called `CKAN_TOKEN` in <a href="../../settings/secrets/actions">Settings > Secrets > Actions</a>.
This token is needed to communicate and write to the Datenregister (CKAN).
The token can either be found on your user profile page, or it can be generated there.
The token needs to belong to a user that has write access to the CKAN organization that the dataset belongs to.
Ideally the user that is responsible for the dataset.
_Important: don't enter an admin-level token here, as this would introduce serious security risks!_
- To initialise the repository, you can <a href="../../edit/master/conf/ckan_updater.json">edit the configuration file</a> in `conf/ckan_updater.json`.
The first time this file is edited, the workflow defined in [init.yml](.github/workflows/init.yml) will be triggered.
The workflow will …
  - … rename the current README.md to `admin.md` (so that it isn't lost).
  - … create a new README.md based on the template in [README.template.md](README.template.md) and the metadata in [conf/ckan_updater.json](conf/ckan_updater.json).
  - … add the URL of the repository as the URL of the dataset in [conf/ckan_updater.json](conf/ckan_updater.json).
  - … disable the init workflow (so that it doesn't get triggered each time the config file is changed).
- Finally, add collaborators to the new repository who will be adding the datafiles.
Collaborators can be added in <a href="../../settings/access">Settings > Access</a>.
Collaborators should have the **Write** role.


## License

All software in this repository is published under the [MIT License](LICENSE).

