# Copilot Instructions for Freelance Management API

This is a .NET 8 ASP.NET Core API project with MongoDB integration and Swagger documentation.

## Project Overview

- **Framework**: ASP.NET Core 8
- **Database**: MongoDB
- **API Documentation**: Swagger/OpenAPI
- **Architecture**: RESTful API with layered architecture

## Key Components

### Database Layer
- MongoDB connection configured in `appsettings.json`
- `ProjectService` handles all database operations

### Controllers
- `ProjectsController` - Manages project CRUD operations

### Models
- `Project` - MongoDB document model
- `MongoDbSettings` - Configuration settings

## Development Guidelines

1. Use `dotnet restore` to install dependencies
2. Ensure MongoDB is running before starting the app
3. Run `dotnet run` to start development server
4. Access Swagger at http://localhost:5000/swagger

## Build and Run

```bash
dotnet build
dotnet run
```

## Dependencies

- Swashbuckle.AspNetCore (Swagger)
- MongoDB.Driver

## Notes

- The project uses top-level statements in Program.cs
- All models use MongoDB BSON serialization attributes
- API follows REST conventions with proper HTTP status codes
