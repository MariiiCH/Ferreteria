using Ferreteri.Models;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Ferreteri.Services
{
    public class MovimientosService : IMovimientosService
    {
        private readonly FerreteriContext _context;
        private readonly DbSet<Movimiento> _dbSet;

        public MovimientosService(FerreteriContext context)
        {
            _context = context;
            _dbSet = _context.Set<Movimiento>();
        }

        public async Task<int> GetCount()
        {
            return await _dbSet.CountAsync();
        }

        public async Task<List<Movimiento>> GetAll()
        {
            return await _dbSet.ToListAsync();
        }

        public async Task<List<Movimiento>> GetByTipo(string tipo)
        {
            return await _dbSet
                .Where(m => m.TipoMov.ToLower() == tipo.ToLower())
                .ToListAsync();
        }
    }
}
