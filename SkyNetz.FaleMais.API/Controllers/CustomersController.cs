using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using SkyNetz.FaleMais.DataAccess;

namespace SkyNetz.FaleMais.API.Controllers
{
    public class CustomersController : ApiController
    {
        private FaleMaisContext db = new FaleMaisContext();

        [HttpPost]
        public async Task<IHttpActionResult> List()
        {
            List<Customers> customers = await db.Customers.ToListAsync();

            if (customers == null)
            {
                return NotFound();
            }

            return Json(customers);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool CustomersExists(int id)
        {
            return db.Customers.Count(e => e.Id == id) > 0;
        }
    }
}