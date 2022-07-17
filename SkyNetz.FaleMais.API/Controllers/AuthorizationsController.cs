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
using Authorization = SkyNetz.FaleMais.DataAccess.Authorization;

namespace SkyNetz.FaleMais.API.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class AuthorizationsController : Base
    {

        public async Task<IHttpActionResult> List()
        {
            List<Authorization> authorization = await db.Authorization.ToListAsync();
            if (authorization == null)
            {
                return NotFound();
            }

            return Json(authorization);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool AuthorizationExists(int id)
        {
            return db.Authorization.Count(e => e.Id == id) > 0;
        }
    }
}