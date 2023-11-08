# Geospatial Data Logger

![App Logo](https://geoportal.un.org/webapps/resources/UNGEOHUB/Geodata-management-4-Multicolor.png)

## Overview

The Geospatial Data Logger is a Ruby on Rails application designed to empower external systems to store and visualize geospatial data. This application exposes an API for external apps to save and retrieve geospatial data and provides an interactive table interface for visualizing this data. Each row in the table includes a map icon, allowing users to explore ticket details and display polygon information on a map.

## Technology Stack

- **Ruby on Rails**: The application is built on Ruby on Rails, a powerful web application framework.
- **Ruby Version**: 3.2.2
- **Rails Version**: 7.1.1
- **Database Type**: Postgres

## Accessibility

The Geospatial Data Logger is hosted on [Fly.io](https://www.fly.io/) and is accessible at [https://geospatial-data-logger.fly.dev/](https://geospatial-data-logger.fly.dev/). External systems can call the data export API endpoint at [https://geospatial-data-logger.fly.dev/api/v1/tickets](https://geospatial-data-logger.fly.dev/api/v1/tickets).

## Local Installation

To set up the application locally, follow these steps:

1. Install Ruby 3.2.2 using RVM (Ruby Version Manager).
2. Set the Ruby version to 3.2.2: `rvm use 3.2.2`.
3. Install necessary gems: `bundle install`.
4. Configure the database and run migrations: `rake db:create && rake db:migrate`.
5. Set up credentials: Run `EDITOR="nano" rails credentials:edit` and provide your Mapbox API key. You can obtain one from the Mapbox platform or contact the project owner for assistance.
6. Start the server: `rails s`.

## Gems and Third-Party Libraries

- **Dry-Struct**: Dry-Struct is utilized to define structured data and perform validation in an organized and maintainable manner.
- **Rubocop**: Rubocop is a Ruby static code analyzer and formatter, which helps maintain consistent code style.
- **Annotate**: Annotate is used to automatically add schema and route information to your models, tests, fixtures, and factories.

### Third-Party Services

- **MapBox**: [Mapbox](https://www.mapbox.com/) is used for map visualization. The project leverages the Mapbox Static Map API to retrieve polygon data and obtain images in response.

## Testing and Linters

- **Testing**: Execute tests with `rails test`.
- **Linters**: Employ Rubocop to maintain a consistent code style.

## Annotations

- Use the Annotate gem to automatically annotate your models, tests, fixtures, and factories with schema information.

## Git Pre-Commit Hook

For maintaining code quality and testing standards, consider configuring a Git pre-commit hook in your repository. This hook will run Rubocop and tests before each commit. Follow these steps:

1. Navigate to your project's `.git/hooks` directory.
2. Create a `pre-commit` file.
3. Insert the following content into the `pre-commit` file:

```bash
#!/bin/bash

export PATH="/path/to/rubocop_directory:$PATH"
rubocop

# Ensure RuboCop passed, or prevent the commit
if [ $? -ne 0 ]; then
  echo "RuboCop found issues. Commit aborted."
  exit 1
fi

# Ensure tests pass:
rails test

```

## Task Reference

- **Task**: [Link to Doc](https://drive.google.com/file/d/1NQ-5M9JaxHj7Pf69htUmBLFIibnBTiHa/view?usp=drive_link)
- **Sample JSON**: [Link to JSON](https://drive.google.com/file/d/1Syl4zyt1EMv5ziHDffbWFmG4ryQgvXmY/view?usp=drive_link)
- **Sample Polygon Data**: [Link to TXT](https://drive.google.com/file/d/1F376aiMjMY1FSE37RQpSROrtEEl_pKvn/view?usp=drive_link)

# About the Author

- **Name**: Elian Braja
- **Personal Website**: [www.elianbraja.com](https://www.elianbraja.com)
- **CV**: [Link to CV](https://www.elianbraja.com/wp-content/uploads/2023/05/CV-Elian-Braja.pdf)

