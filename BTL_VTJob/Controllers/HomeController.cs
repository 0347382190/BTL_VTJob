using BTL_VTJob.Data;
using BTL_VTJob.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using System.Xml.Linq;

namespace BTL_VTJob.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly dbContext _context;
        public HomeController(ILogger<HomeController> logger,dbContext context)
        {
            _logger = logger;
            _context = context;
        }

       
            public async Task<IActionResult> Index()
            {
                var list = _context.BaiTuyenDung.Include(p => p.DoanhNghiep).Include(p => p.LoaiCongViec);
                return View(await list.ToListAsync());

            }
        [HttpPost]
        public async Task<IActionResult> Search(string content_search)
        {

            var list = _context.BaiTuyenDung.Include(p => p.DoanhNghiep).Include(p => p.LoaiCongViec).Where(p => p.TieuDe.Contains(content_search));
            return PartialView("Contenttimkhiem", await list.ToListAsync()); ;
        }

        public async Task<IActionResult> Privacy()
        {
           
                var list = _context.BaiTuyenDung.Include(p => p.DoanhNghiep).Include(p => p.LoaiCongViec);
                return View(await list.ToListAsync());

        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}