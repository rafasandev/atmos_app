# atmos_app

A NASA weather data application.

## Project Description

Our project is a platform designed to deliver environmental indicators, such as air quality and UV radiation levels, and more importantly, to issue critical real-time alerts. Its key differentiator is the ability to function for users **even without internet access**.

The operational proposal is based on a feasibility study to use the network infrastructure of mobile operators to send notifications. Through partnerships, the system would send an alert signal that would be picked up by the application, ensuring the information reaches everyone, regardless of internet connectivity. The operational proposal explores technologies that do not rely on mobile data. Through partnerships with mobile operators, the system could broadcast alerts using protocols like Cell Broadcast, which is used for national emergency alerts that override cellular traffic, or even mass SMS messages. A secondary explored pathway includes leveraging FM radio signals with RDS (Radio Data System), a technology that embeds small amounts of text data into standard FM broadcasts, reaching devices with active FM receivers.

The main benefit is the democratization of access to vital safety information. It protects populations in remote and vulnerable areas, such as the Amazon, rural zones, or other regions with limited internet infrastructure. The application serves as a prevention tool, allowing users and authorities to act quickly in high-risk situations, such as pollution spikes, or abnormal atmospheric and solar activities.

The intended impact is to save lives and reduce damage by transcending the connectivity barrier. We aim to create a public safety solution that is not just another weather app, but an essential tool that solves the problem of information access in critical moments. The goal is for authorities to use the platform to issue mass alerts effectively, coordinating evacuations and other safety measures for the entire population in an at-risk area.

For the development of the prototype and platform, we used the following technologies:
* **Front-end:** Flutter, using the Android Studio IDE.
* **Back-end:** Docker for containerization and a low-code approach with the n8n tool for workflow automation.
* **APIs:** Consumption and cross-referencing of data from multiple APIs to ensure the accuracy of the indicators.

The project's creativity lies not in displaying the data, but in ensuring its delivery. While conventional applications are entirely dependent on the internet, our solution is innovative for decoupling emergency notifications from the need for a data connection, focusing on reaching the user under any conditions. The proposal to use mobile operator signal infrastructure for this purpose is the project's key innovation, creating a new communication layer for emergencies.

Our team primarily considered the digital divide and the vulnerability of populations in remote areas. We reflected on how current alert systems fail to reach those who need them most because they rely on an internet infrastructure that is not universal. Therefore, the project was designed not to compete with existing applications, but to evolve and serve a critical, neglected niche: the safety of everyone, whether connected or not.

---
## About the n8n Tool

This project's backend uses [n8n](https://n8n.io/), a low-code workflow automation tool. While this repository provides a ready-to-run Docker setup, you might want to install and explore n8n on your own.

There are several ways to do this:

### Option 1: n8n Desktop App (Easiest)
The simplest way to get started is by downloading the desktop application, available for Windows, macOS, and Linux.
* [Download n8n Desktop](https://n8n.io/desktop/)

### Option 2: Using Docker (Standalone)
If you already have Docker, you can start an n8n instance with a single command:
```sh
docker run -it --rm --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8nio/n8n
```

### Option 3: Using npm (For Node.js Users)
If you have Node.js installed, you can install n8n globally:
```sh
npm install n8n -g
# And to start it:
n8n
```

---
## Backend Setup (n8n Workflow Automation) 🚀

This section explains how to start this project's n8n server using Docker.

### Prerequisites
* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

### How to Run

#### 1. Configure the Environment
Copy the example file `.env.example` to a new file named `.env`.
```sh
cp .env.example .env
```
Open the `.env` file and change the value of the `POSTGRES_PASSWORD` variable to a strong password of your choice.

#### 2. Start the Containers
Start the n8n and database services in the background (`-d`).
```sh
docker-compose up -d
```
After initialization, the n8n UI will be available at: **[http://localhost:5678](http://localhost:5678)**.

#### 3. Import the Atmosphere Workflow
1.  Access the n8n UI at [http://localhost:5678](http://localhost:5678).
2.  In the main menu, click **Import > Import from File**.
3.  Select the `workflow.json` file from this repository.
4.  In the top-right corner, click the toggle switch to make the workflow **"Active"**.

#### 4. Configure API Credentials
The workflow needs credentials to access the Meteomatics API.
1.  **Create an account:** Go to [Meteomatics API Getting Started](https://www.meteomatics.com/en/api/getting-started/) and create a free account to get your API **username** and **password**.
2.  **Add credentials in n8n:**
    * Go to the **"Credentials"** section in the left-hand menu.
    * Click **"Add credential"** and select **"Basic Auth"**.
    * Fill in the `User` and `Password` fields with your Meteomatics credentials and save.
3.  **Link credentials to the workflow:**
    * Go back to the workflow, find the Meteomatics **"HTTP Request"** node.
    * Under "Authentication", choose the credential you just created.
    * **Save the workflow** again.

---
## Frontend Setup (Flutter) 📱

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the [online documentation](https://docs.flutter.dev/).
