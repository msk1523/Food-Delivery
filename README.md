Padosi-ka-Khana: The love story between the local street-food vendor and street-smart foodies!
Padosi-ka-Khana

A food-delivery application connecting local street vendors to the street-smart foodies.


Overview

In this blog, we’ll explore how to create a fully functional food-delivery application, “Padosi-Ka-Khana,” which connects customers to neighbouring street foods. The blog aims to provide a platform for vendors with the least listing fees and focuses on building a seamless user experience, efficient backend, and advanced features like chatbots and payment gateways. By the end of this blog, you’ll have a comprehensive understanding of this food-delivery app.

Architecture

The architecture of “Padosi-Ka-Khana” is built around a modular and scalable design.

a. Key Components:

- Frontend/UI: Flutter ensures a responsive and visually appealing interface across platforms.

- Backend: Firebase provides real-time database functionality and authentication.

- Chatbot Integration: Gemini 2.0 Flash enhances user interactions through AI-driven chat support.

- Payment Gateway: Stripe API enables secure and smooth payment transactions.

b. Design Rationale:

- Usability: Flutter’s widget-based design makes UI development intuitive.

- Scalability: Firebase handles growing user demands efficiently.

- Automation: The chatbot minimizes manual customer support.

- Security: Stripe API ensures safe payment processing.

c. Visual Elements:

- System architecture diagram showcasing frontend-backend interaction.

- Workflow of chatbot integration within the app.

Prerequisites

To follow along, ensure you have the following:

a. Software Requirements:

- Flutter SDK: [Download here]

- Firebase account and project setup: [Firebase Console]

- Gemini 2.0 Flash chatbot API access.

- Stripe account for API integration: [Stripe]

b. Basic Knowledge:

- Familiarity with Dart programming.

- Understanding of Flutter widgets and Firebase services.

- Basic knowledge of API integration.

Step-by-Step instructions

Step 1: Set Up the Project

Install Flutter and create a new project using `flutter create padosi_ka_khana`.

2. Add Firebase to your project by integrating the required dependencies in `pubspec.yaml`.


3. Configure Firebase Authentication for user login and signup.

Step 2: Build the User Interface

1. Design a user-friendly UI with screens for:

- Home Page: Showcasing available vendors nearby.

- Profile: For users to upload and manage their menu.

- Order History: Tracking past and current orders.

2. Use Flutter’s state management (e.g., Provider or Riverpod) for smooth navigation.

Step 3: Integrate Firebase for Backend Functionality

1. Set up Firestore for storing user and order data.

2. Configure Firebase Cloud Messaging for push notifications about order updates.

Step 4: Add Chatbot Support with Gemini 2.0 Flash

1. Obtain API keys from Gemini 2.0 Flash.

2. Use HTTP requests in Flutter to connect the chatbot API.

3. Implement a chat screen where users can interact with the bot for FAQs, order support, etc.

Step 5: Implement Payment Gateway

1. Set up a Stripe account and retrieve your API keys.

2. Integrate Stripe’s Flutter SDK to process payments.

3. Test transactions in Stripe’s sandbox environment.

Step 6: Testing and Debugging

1. Test the app on multiple devices for UI consistency.

2. Use Firebase Crashlytics to monitor and fix issues.

Demo

Once completed, your “Padosi-ka-khana” app will allow users to:

- Browse and order dishes from the neighbourhood.


Home Screen of Padosi-ka-khana
- Chat with an AI-driven support bot.


ChatBot powered by Gemini 2.0 flash
- Securely pay via Stripe.


Stripe Payment gateway
- Receive real-time updates on order status.


Carts page of Padosi-ka-khana
What’s next?

To expand this project:

- Add a review and rating system for dishes.

- Implement multi-language support for wider accessibility.

- Enhance AI capabilities in the chatbot for personalised recommendations.

Call to Action

To learn more about Google Cloud services and to create an impact for the work you do, get around to these steps right away:

Register for Code Vipassana sessions

Join the meetup group Datapreneur Social

Sign up to become Google Cloud Innovator

Connect with me(Sivakumaran M) on LinkedIn and GitHub .

Tap here -> Padosi-Ka-Khana to refer to the open-source code in GitHub.

Github link: https://github.com/msk1523/Food-Delivery
LinkedIn link: https://www.linkedin.com/in/siva-kumaran-manivaannan-012a7724a/

# food_delivery

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
