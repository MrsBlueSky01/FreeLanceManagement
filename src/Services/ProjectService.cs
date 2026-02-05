using FreelanceManagement.Models;
using FreelanceManagement.Settings;
using MongoDB.Driver;
using Microsoft.Extensions.Options;

namespace FreelanceManagement.Services;

public class ProjectService
{
    private readonly IMongoCollection<Project> _projectsCollection;

    public ProjectService(IOptions<MongoDbSettings> mongoDbSettings)
    {
        var mongoClient = new MongoClient(mongoDbSettings.Value.ConnectionString);
        var mongoDatabase = mongoClient.GetDatabase(mongoDbSettings.Value.DatabaseName);
        _projectsCollection = mongoDatabase.GetCollection<Project>("projects");
    }

    public async Task<List<Project>> GetAsync() =>
        await _projectsCollection.Find(_ => true).ToListAsync();

    public async Task<Project?> GetByIdAsync(string id) =>
        await _projectsCollection.Find(x => x.Id == id).FirstOrDefaultAsync();

    public async Task CreateAsync(Project newProject)
    {
        newProject.CreatedAt = DateTime.UtcNow;
        newProject.UpdatedAt = DateTime.UtcNow;
        await _projectsCollection.InsertOneAsync(newProject);
    }

    public async Task UpdateAsync(string id, Project updatedProject)
    {
        updatedProject.UpdatedAt = DateTime.UtcNow;
        await _projectsCollection.ReplaceOneAsync(x => x.Id == id, updatedProject);
    }

    public async Task DeleteAsync(string id) =>
        await _projectsCollection.DeleteOneAsync(x => x.Id == id);
}
