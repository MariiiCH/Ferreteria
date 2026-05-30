// Services/ProductosService.cs (updated)
using Ferreteri.Models;
using Microsoft.EntityFrameworkCore;

namespace Ferreteri.Services
{
    public class ProductosService : IProductosService
    {
        private readonly FerreteriContext _context;
        private readonly DbSet<Producto> _dbSet;
        private readonly DbSet<Movimiento> _movimientosDbSet;

        public ProductosService(FerreteriContext context)
        {
            _context = context;
            _dbSet = _context.Set<Producto>();
            _movimientosDbSet = _context.Set<Movimiento>();
        }

        public async Task<int> AddProducto(Producto producto)
        {
            await _dbSet.AddAsync(producto);
            await _context.SaveChangesAsync();

            var movimiento = new Movimiento
            {
                FkIdProd = producto.IdProd,
                TipoMov = "CREACION".ToLowerInvariant(),
                Cantidad = producto.Stock ?? 0,
                Fecha = DateOnly.FromDateTime(DateTime.Now)
            };

            await _movimientosDbSet.AddAsync(movimiento);
            return await _context.SaveChangesAsync();
        }

        public async Task<int> GetCount()
        {
            return await _dbSet.CountAsync();
        }

        public async Task<List<Producto>> ListarProductos()
        {
            return await _dbSet.ToListAsync();
        }

        public async Task<int> RemoveProducto(int id)
        {
            var producto = await _dbSet.FirstOrDefaultAsync(p => p.IdProd == id);
            if (producto == null)
                return 0;

            var movimiento = new Movimiento
            {
                FkIdProd = producto.IdProd,
                TipoMov = "ELIMINACION".ToLowerInvariant(),
                Cantidad = producto.Stock ?? 0,
                Fecha = DateOnly.FromDateTime(DateTime.Now)
            };

            await _movimientosDbSet.AddAsync(movimiento);

            _dbSet.Remove(producto);
            return await _context.SaveChangesAsync();
        }

        public async Task<int> UpdateProducto(Producto producto)
        {
            var productoActual = await _dbSet.FirstOrDefaultAsync(p => p.IdProd == producto.IdProd);
            if (productoActual == null)
                return 0;

            int stockAnterior = productoActual.Stock ?? 0;

            productoActual.Nombre = producto.Nombre;
            productoActual.Precio = producto.Precio;
            productoActual.Stock = producto.Stock;
            productoActual.FkIdCategoria = producto.FkIdCategoria;

            if (stockAnterior != (producto.Stock ?? 0))
            {
                var movimiento = new Movimiento
                {
                    FkIdProd = producto.IdProd,
                    TipoMov = "AJUSTE".ToLowerInvariant(),
                    Cantidad = (producto.Stock ?? 0) - stockAnterior,
                    Fecha = DateOnly.FromDateTime(DateTime.Now)
                };

                await _movimientosDbSet.AddAsync(movimiento);
            }

            return await _context.SaveChangesAsync();
        }
    }
}