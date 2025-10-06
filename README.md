# atmos_app

NASA Weather data app

Our project is a platform designed to deliver environmental indicators, such as air quality and UV radiation levels, and more importantly, to issue critical real-time alerts. Its key differentiator is the ability to function for users even without internet access.
The operational proposal is based on a feasibility study to use the network infrastructure of mobile operators to send notifications. Through partnerships, the system would send an alert signal that would be picked up by the application, ensuring the information reaches everyone, regardless of internet connectivity.
The operational proposal explores technologies that do not rely on mobile data. Through partnerships with mobile operators, the system could broadcast alerts using protocols like Cell Broadcast, which is used for national emergency alerts that override cellular traffic, or even mass SMS messages. A secondary explored pathway includes leveraging FM radio signals with RDS (Radio Data System), a technology that embeds small amounts of text data into standard FM broadcasts, reaching devices with active FM receivers.
The main benefit is the democratization of access to vital safety information. It protects populations in remote and vulnerable areas, such as the Amazon, rural zones, or other regions with limited internet infrastructure. The application serves as a prevention tool, allowing users and authorities to act quickly in high-risk situations, such as pollution spikes, or abnormal atmospheric and solar activities.
The intended impact is to save lives and reduce damage by transcending the connectivity barrier. We aim to create a public safety solution that is not just another weather app, but an essential tool that solves the problem of information access in critical moments. The goal is for authorities to use the platform to issue mass alerts effectively, coordinating evacuations and other safety measures for the entire population in an at-risk area.
For the development of the prototype and platform, we used the following technologies:
Front-end: Flutter, using the Android Studio IDE.
Back-end: Docker for containerization and a low-code approach with the n8n tool for workflow automation.
APIs: Consumption and cross-referencing of data from multiple APIs to ensure the accuracy of the indicators.
The project's creativity lies not in displaying the data, but in ensuring its delivery. While conventional applications are entirely dependent on the internet, our solution is innovative for decoupling emergency notifications from the need for a data connection, focusing on reaching the user under any conditions. The proposal to use mobile operator signal infrastructure for this purpose is the project's key innovation, creating a new communication layer for emergencies.
Our team primarily considered the digital divide and the vulnerability of populations in remote areas. We reflected on how current alert systems fail to reach those who need them most because they rely on an internet infrastructure that is not universal. Therefore, the project was designed not to compete with existing applications, but to evolve and serve a critical, neglected niche: the safety of everyone, whether connected or not.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
