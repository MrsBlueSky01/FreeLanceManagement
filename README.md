<<<<<<< HEAD
# FreeLanceManagement
"A robust Freelance Management API built with .NET 10 and MongoDB Atlas, featuring a full CRUD system, Repository/Service pattern, and Swagger UI integration for seamless project tracking.
=======
# Freelance Management API

A .NET 8 ASP.NET Core API for managing freelance projects with MongoDB integration and Swagger documentation.

## Prerequisites

- .NET 8 SDK
- MongoDB (local or remote connection)

## Getting Started

### 1. Install Dependencies

```bash
dotnet restore
```

### 2. Configure MongoDB

Update `appsettings.json` with your MongoDB connection string:

```json
{
  "MongoDbSettings": {
    "ConnectionString": "mongodb://localhost:27017",
    "DatabaseName": "FreelanceManagement"
  }
}
```

### 3. Run the Application

```bash
dotnet run
```

The API will start on `https://localhost:5001` and `http://localhost:5000`.

### 4. Access Swagger UI

Navigate to:

- **Swagger UI**: http://localhost:5000/swagger
- **Swagger JSON**: http://localhost:5000/swagger/v1/swagger.json

## Project Structure

```
src/
├── Controllers/      # API endpoints
├── Models/          # Data models
├── Services/        # Business logic
└── Settings/        # Configuration classes
```

## API Endpoints

### Projects

- `GET /api/projects` - Get all projects
- `GET /api/projects/{id}` - Get project by ID
- `POST /api/projects` - Create new project
- `PUT /api/projects/{id}` - Update project
- `DELETE /api/projects/{id}` - Delete project

## Example Request

```json
POST /api/projects
{
  "name": "Website Redesign",
  "description": "Complete redesign of company website",
  "status": "In Progress"
}
```

## Build and Publish

### Development Build

```bash
dotnet build
```

### Release Build

```bash
dotnet publish -c Release
```

## Requirements

- MongoDB 4.4+
- .NET 8.0+

## Technologies

- ASP.NET Core 8
- Swagger/OpenAPI
- MongoDB Driver
- C# 12
>>>>>>> d227813 (Initial commit: Freelance API temeli ve MongoDB bağlantısı kuruldu)
