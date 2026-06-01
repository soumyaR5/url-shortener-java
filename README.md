# URL Shortener

A cloud-hosted URL Shortener built using Java Servlets, JSP, JDBC, PostgreSQL, Docker, and Render. The application generates unique short URLs, redirects users to original URLs, tracks click counts, and stores data in a cloud PostgreSQL database.

## Features

* Generate unique short URLs for long links
* Automatic redirection to original URLs
* Duplicate URL detection
* Click count tracking and analytics
* Cloud-hosted PostgreSQL database using Neon
* Dockerized deployment
* Publicly accessible through Render
* MVC-based architecture using Servlets and JSP

## Tech Stack

### Backend

* Java
* Servlets
* JSP
* JDBC

### Database

* PostgreSQL (Neon)

### Deployment & DevOps

* Docker
* Render

### Architecture

* MVC (Model-View-Controller)

## Project Structure

URL Shortener
├── Controller (Servlets)
├── Model (Java Classes)
├── DAO Layer (JDBC)
├── Views (JSP Pages)
├── PostgreSQL Database
└── Docker Configuration

## Key Functionalities

### URL Shortening

Users can submit long URLs and receive a unique short URL.

### URL Redirection

The system automatically redirects users from the short URL to the original destination.

### Duplicate URL Detection

Existing URLs are identified and reused instead of generating unnecessary duplicates.

### Click Analytics

Tracks the number of visits for each shortened URL.

### Cloud Database Integration

Uses Neon PostgreSQL for persistent cloud storage.

### Containerized Deployment

Application is packaged using Docker and deployed on Render.

## Deployment

Live Application:
[[Your Render URL Here]](https://url-shortener-java-c3ge.onrender.com/)

## Future Enhancements

* User Authentication
* URL Expiration
* Custom Short Codes
* QR Code Generation
* Dashboard Analytics
* REST API Support
* Redis Caching for Faster Redirects

## Learning Outcomes

* Java Web Development using Servlets and JSP
* JDBC Database Connectivity
* PostgreSQL Cloud Database Integration
* Docker Containerization
* Cloud Deployment using Render
* MVC Architecture Design
* Environment Variable Configuration
* Production Deployment Workflow

## Author

Soumya Ramchandran
