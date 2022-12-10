<a name="readme-top"></a>

# 🔗 Tiny Url <a name="about-project"></a>

> This is a RoR mobile app created for shortening the long url links. It is a simple app that allows users to create an account and shorten their links. The app also allows users to see the number of clicks on their links.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

- Ruby
- Rails Framework
- PostgreSQL

<!-- Features -->

### Key Features <a name="key-features"></a>

- **register and log in, so that the data is private to them.**
- **can register anonymously and create a short url**
- **can make a short url by giving alphanumeric characters upto 16 digits**
- **See the most clicked links created by user**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Ruby runtime environment.
  > If you dont have installed on your computer, you can download it from [here](https://www.ruby-lang.org/en/downloads/).
- PostgreSQL.
  > If you dont have installed on your computer, you can download it from [here](https://www.postgresql.org/download/).
- Rails.
  > If you dont have installed on your computer, you can download it from [here](https://rubyonrails.org/).

### Setup

If you have installed git you can clone the code to your machine, or download a ZIP of all the files directly.

[Download the ZIP](https://github.com/ishpaul777/tiny-url/archive/refs/heads/main.zip), or run the following commands to clone the files to your machine:

```bash
git clone git@github.com:ishpaul777/tiny-url.git
cd tiny-url
```

### Install

- Once the files are on your machine, open the blog-app folder in your code editor. Run the following command in your terminal to install the required gems and run the application:

Install gem packages with:

```bash
bundle install
```

- Open the `config/database.yml` file in the project directory and change the username and password to your PostgreSQL username and password. Edit the default section of the file to look like this:

```rb
 default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <your PostgreSQL role username>
  password: <your PostgreSQL role password>
```

- Create the database with:

```bash
rails db:create
```

- Run the migrations with:

```bash
rails db:migrate
```

- Finally, run the server with:

```bash
rails server
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Ishpaul Singh**

- GitHub: [@ishpaul777](https://github.com/ishpaul777)
- Twitter: [@ishpaul777](https://twitter.com/ishpaul777)
- LinkedIn: [LinkedIn](https://linkedin.com/in/ishpaul777)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project give it a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

- This medium article by [Sandeep Verma](https://medium.com/@sandeep4.verma) helped me to understand the concept of shortening the url links.
  > [System Design : Scalable URL shortener service like TinyURL](https://medium.com/%40sandeep4.verma/system-design-scalable-url-shortener-service-like-tinyurl-106f30f23a82)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
