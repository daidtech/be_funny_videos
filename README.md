# Video Sharing Platform

## Demo
- Visit: [https://demo1.dinhvandai.com/](https://demo1.dinhvandai.com/)

## Introduction
This project is a **video-sharing platform** built with **Rails 7.1+** (backend) and **React 19+** (frontend). It allows users to:
- **Register/Login/Logout** securely
- **Share YouTube video links**
- **Preview shared videos** in an intuitive UI
- **Realtime notification** when a new video is shared

## Prerequisites
Ensure you have the following installed:
- **Ruby**: 3.2+
- **Rails**: 7.1+
- **Postgres**: 16+
- **Node.js**: 20+
- **Next.js**: 15.1+
- **React**: 19+
- **Docker & Docker Compose** (optional, for containerized deployment)

## Installation & Configuration

## Setup Backend
###  1. Clone the Repository
```sh
git clone git@github.com:daidtech/be_funny_videos.git
cd be_funny_videos
```

### 2. Install Backend Dependencies
```sh
rvm use
bundle install
```
### 3. Set Up Environment Variables
Add the database configuration in `database.yml` according to your PostgreSQL setup:
```yml
development:
  <<: *default
  database: youtube_video_sharing_development
  username: #  ** your_user_name_postgres **
  password: #  ** your_password_postgres **
  host: localhost
  port: 5432

```

## Setup Frontend
###  1. Clone the Repository

```sh
git clone git@github.com:daidtech/fe_funny_videos.git
cd fe_funny_videos
```
### 2. Install Frontend Dependencies
```sh
cd frontend
nvm use
yarn install
```


## Database Setup

Create & Migrate the Database

```sh
rails db:create db:migrate db:seed
```

## Running the Application

### 1. Start Backend (Rails API Server)
```sh
cd be_funny_videos
rails s
```

### 2. Start Frontend (Next.js Development Server)
```sh
cd fe_funny_videos
yarn dev
```

### 3. Access the Application
Visit: [http://localhost:8000](http://localhost:8000)

## Usage
- **Register**: Fill in your email and password in the header and then click 'Register'.
- **Login**: Fill in your email and password in the header and then click 'Login'.
- **Share YouTube video**: Click 'Share a movie' to navigate to the share video page, fill in the video link, title, and description, and click 'Share' to share the video. A notification will pop up for all other users.
- **View list of videos**: Click the home icon in the header to access the home page and view the list of videos. Reload the page if you don't see the video. Contact the admin or send me a offer to fix the issue :)).

## Troubleshooting

### 1. `nvm: command not found`
- Ensure you have install nvm and according node version
- install nvm script: [Link](https://github.com/nvm-sh/nvm?tab=readme-ov-file#install--update-script)
- `nvm install 20.18.1` to install node version

### 2. `rvm: command not found`
- Ensure you have install rvm and according ruby version
- install rvm script: [Link](https://rvm.io/rvm/install)
- `rvm install 3.2.2` to install ruby version

### 3. `rails db:create` fails
- Ensure database.yml is updated

### 4. Webpack issues in Nextjs
- Try deleting `node_modules` and reinstalling:
```sh
rm -rf node_modules package-lock.json
yarn install  # or npm install
```

For any other issues, check the logs and ensure all dependencies are installed correctly.