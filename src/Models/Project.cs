using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace FreelanceManagement.Models;

public class Project
{
    [BsonId]
    [BsonRepresentation(BsonType.ObjectId)]
    public string? Id { get; set; } // MongoDB bunu otomatik atayacak

    public string Name { get; set; } = null!; // "name" alanı için
    public string Description { get; set; } = null!; // "description" alanı için
    public string Status { get; set; } = null!; // "status" alanı için

    public DateTime CreatedAt { get; set; }
    public DateTime UpdatedAt { get; set; }
}