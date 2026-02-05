using Microsoft.AspNetCore.Mvc;
using FreelanceManagement.Models;
using FreelanceManagement.Services;

namespace FreelanceManagement.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ProjectController : ControllerBase
{
    // HATA BURADAYDI: IMongoCollection yerine ProjectService kullanmalıyız
    private readonly ProjectService _projectService;

    public ProjectController(ProjectService projectService)
    {
        _projectService = projectService;
    }

    [HttpGet]
    public async Task<List<Project>> Get() =>
        await _projectService.GetAsync();

    [HttpGet("{id:length(24)}")]
    public async Task<ActionResult<Project>> Get(string id)
    {
        var project = await _projectService.GetByIdAsync(id);
        if (project is null) return NotFound();
        return project;
    }

    [HttpPost]
    public async Task<IActionResult> Post(Project newProject)
    {
        await _projectService.CreateAsync(newProject);
        return CreatedAtAction(nameof(Get), new { id = newProject.Id }, newProject);
    }

    [HttpPut("{id:length(24)}")]
    public async Task<IActionResult> Update(string id, [FromBody] Project updatedProject) // [FromBody] eklendi
    {
        var project = await _projectService.GetByIdAsync(id);
        if (project is null) return NotFound();

        updatedProject.Id = id; // Güvenlik için ID'yi URL'dekiyle eşitliyoruz
        await _projectService.UpdateAsync(id, updatedProject);
        return NoContent();
    }

    [HttpDelete("{id:length(24)}")]
    public async Task<IActionResult> Delete(string id)
    {
        var project = await _projectService.GetByIdAsync(id);
        if (project is null) return NotFound();

        await _projectService.DeleteAsync(id);
        return NoContent();
    }
}