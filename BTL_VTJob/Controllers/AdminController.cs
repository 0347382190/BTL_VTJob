using Microsoft.AspNetCore.Mvc;

namespace BTL_VTJob.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
