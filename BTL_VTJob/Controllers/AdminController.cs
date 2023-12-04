using BTL_VTJob.Data;
using BTL_VTJob.Models;
using BTL_VTJob.ViewModel;
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
       
        //[HttpPost]
        public IActionResult CreateUser(NguoiDung register)
        {
            if(register.Email == null) {
                return View();
            }

            var checkedUser = _context.Nguoidung.Where(u => u.Email.Equals(register.Email)).FirstOrDefault();
            if (checkedUser != null)
            {
                ModelState.AddModelError("Email", "Email is exsist");
                return View(register);
            }
            using (var trans = _context.Database.BeginTransaction())
            {
                var user = new NguoiDung();
                user.Email = register.Email;
                user.Hoten = register.Hoten;
                user.SoDT = register.SoDT;
                user.MatKhau = register.MatKhau;
                user.quyen = "user";
                _context.Nguoidung.Add(user);
                _context.SaveChanges();
                return View();
            }
        }
    }
}
