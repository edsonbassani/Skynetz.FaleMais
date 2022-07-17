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
    public class PlansController : Base
    {
        [HttpPost]
        public async Task<IHttpActionResult> List()
        {
            List<Plans> plans = await db.Plans.ToListAsync();
            if (plans == null)
            {
                return NotFound();
            }

            return Json(plans);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PlansExists(int id)
        {
            return db.Plans.Count(e => e.Id == id) > 0;
        }
    }
}