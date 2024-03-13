<a name="readme-top"></a>

![GitHub Workflow Status (with event)](https://img.shields.io/github/actions/workflow/status/derchrischkya/elastic-certification/release.yaml)
![GitHub release (with filter)](https://img.shields.io/github/v/release/derchrischkya/elastic-certification)
<br />
<div align="center">
  <h3 align="center"></h3>

  <p align="center">
    <br />
    <a href="https://github.com/derchrischkya/elastic-certification"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    ·
    <a href="https://github.com/derchrischkya/elastic-certification/issues">Report Bug</a>
    ·
    <a href="https://github.com/derchrischkya/elastic-certification/issues">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

This project is used to cover basic requirements for elastic certified engineer exam.


### About the exam
- 3h practical hands-on exam on 10 tasks
- no multiple choice questions

### Exam topics
1. Data Management
- Define an index that satisfies a given set of requirements
- Define and use an index elastic-certification for a given pattern that satisfies a given set of requirements
- Define and use a dynamic elastic-certification that satisfies a given set of requirements
- Define an Index Lifecycle Policy for a time-series index
- Define an index elastic-certification that creates a new data stream

2. Searching data
- Write and execute a search query for terms and/or phrases in one or more fields of an index
- Write and execute a search query that is a boolean combination of multiple queries and filters
- Write and execute metric and bucket aggregations
- Write and execute aggregations that contain sub-aggregations
- Write and execute a query that searches accross multiple clusters
- Write and execute a search that utilizes a runtime field

3. Developing search applications
- Highlight the search terms in the response of a query
- Sort the results of a query by a given set of requirements
- Implement pagination of the results of a search query
- Define and use index aliases
- Define and use a search elastic-certification

4. Data Processing
- Define a mapping that satisfies a given set of requirements
- Define and use a custom analyzer that satisfies a given set of requirements
- Define and use multi-fields with different data types and/or analyzers
- Use the Reindex API and update by query api to reindex
- Define and use an ingest pipleine that satisfies a given set of requirements, including the use of painless to modify docuemnts
- Define runtime fields to retrieve custom values using painless scripting

5. Cluster Management
- Diagnose shard issues and repair a cluster's health
- Backup and restore a cluster and/or specific indices
- Configure a snapshot to be searchable
- Configure a cluster for cross cluster search
- Implement cross-cluster replication

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With
- Markdown
- Docker

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started
### Prerequisites

- Docker
- Docker-compose

### Installation

_Below is an example of how you can instruct your audience on installing and setting up your app. This elastic-certification doesn't rely on any external dependencies or services._

0. Clone the repo
   ```sh
   git clone git@github.com:derchrischkya/elastic-certification.git
   ```
1. Check out the `project` or `topics` folder
2. Spin up elastic deployment with make command, check out possibilities with `make help`
   ```sh
   cd ./deployment
   make help
   ```
3. Go for practical hands-on!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- ROADMAP -->
## Roadmap

- [x] 

See the [open issues](https://github.com/derchrischkya/elastic-certification/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Christoph Richter  - christoph.richter1997@gmail.com

Project Link: [https://github.com/derchrischkya/elastic-certification](https://github.com/derchrischkya/elastic-certification)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [GitHub Pages](https://pages.github.com)
* [Font Awesome](https://fontawesome.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
