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
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class FaresController : Base
    {
        [HttpPost]
        public async Task<IHttpActionResult> Get(int id)
        {
            Fares fares = await db.Fares.FindAsync(id);
            if (fares == null)
            {
                return NotFound();
            }

            return Json(fares);
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool FaresExists(int id)
        {
            return db.Fares.Count(e => e.Id == id) > 0;
        }
    }
}