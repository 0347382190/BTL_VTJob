using BTL_VTJob.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BTL_VTJob.Controllers
{
    public class AdminController : Controller
    {
        private readonly dbContext _context;
        private readonly ILogger<HomeController> _logger;
        public AdminController(ILogger<HomeController> logger, dbContext context)
        {
            _logger = logger;
            _context = context;
        }
        public async Task<IActionResult> Index()
        {
            var list = await _context.Nguoidung.ToListAsync();
            return View(list);

        }
    }
}
