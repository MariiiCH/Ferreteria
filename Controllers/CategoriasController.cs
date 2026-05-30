using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Ferreteri.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriasController : ControllerBase
    {
        private readonly Services.ICategoriasService _categoriasService;

        public CategoriasController(Services.ICategoriasService categoriasService)
        {
            _categoriasService = categoriasService;
        }
        [HttpGet]
        [Route("count")]
        public async Task<IActionResult> GetCount()
        {
            var count = await _categoriasService.GetCount();
            return Ok(count);
        }
        [HttpGet]
        [Route("listar")]
        public async Task<IActionResult> ListarCategorias()
        {
            var categorias = await _categoriasService.ListarCategorias();
            return Ok(categorias);
        }
        [HttpPost]
        [Route("add")]
        public async Task<IActionResult> AddCategoria([FromBody] Models.Categoria categoria)
        {
            var filasAfectadas = await _categoriasService.AddCategoria(categoria);
            return Ok(filasAfectadas);
        }
        [HttpDelete]
        [Route("remove/{id}")]
        public async Task<IActionResult> RemoveCategoria(int id)
        {
            try
            {
                var filasAfectadas = await _categoriasService.RemoveCategoria(id);
                return Ok(filasAfectadas);
            }
            catch (Exception ex)
            {
                return BadRequest(new { mensaje = ex.Message });
            }
        }
    }
}
