using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Ferreteri.Models;

public partial class FerreteriContext : DbContext
{
    public FerreteriContext()
    {
    }

    public FerreteriContext(DbContextOptions<FerreteriContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Categoria> Categorias { get; set; }

    public virtual DbSet<Movimiento> Movimientos { get; set; }

    public virtual DbSet<Producto> Productos { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=DEVELOSER-PC\\MSSQLSERVER_DEV;Database=FERRETERI;Integrated Security=True;TrustServerCertificate=True");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Categoria>(entity =>
        {
            entity.HasKey(e => e.IdCategoria).HasName("PK__Categori__8A3D240C91108C2B");

            entity.Property(e => e.IdCategoria).HasColumnName("idCategoria");
            entity.Property(e => e.Nombre)
                .HasMaxLength(100)
                .HasColumnName("nombre");
        });

        modelBuilder.Entity<Movimiento>(entity =>
        {
            entity.HasKey(e => e.IdMov).HasName("PK__Movimien__3DC69A4F5619E720");

            entity.Property(e => e.IdMov).HasColumnName("idMov");
            entity.Property(e => e.Cantidad).HasColumnName("cantidad");
            entity.Property(e => e.Fecha).HasColumnName("fecha");
            entity.Property(e => e.FkIdProd).HasColumnName("FK_idProd");
            entity.Property(e => e.TipoMov)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("tipoMov");

            entity.HasOne(d => d.FkIdProdNavigation).WithMany(p => p.Movimientos)
                .HasForeignKey(d => d.FkIdProd)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Productos_Movimientos");
        });

        modelBuilder.Entity<Producto>(entity =>
        {
            entity.HasKey(e => e.IdProd).HasName("PK__Producto__B41BB0CAED90ABB0");

            entity.Property(e => e.IdProd).HasColumnName("idProd");
            entity.Property(e => e.FkIdCategoria).HasColumnName("FK_idCategoria");
            entity.Property(e => e.Nombre)
                .HasMaxLength(75)
                .IsUnicode(false)
                .HasColumnName("nombre");
            entity.Property(e => e.Precio)
                .HasColumnType("decimal(10, 2)")
                .HasColumnName("precio");
            entity.Property(e => e.Stock).HasColumnName("stock");

            entity.HasOne(d => d.FkIdCategoriaNavigation).WithMany(p => p.Productos)
                .HasForeignKey(d => d.FkIdCategoria)
                .HasConstraintName("FK_Productos_Categorias");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
