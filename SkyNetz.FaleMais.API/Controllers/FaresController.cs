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
using Newtonsoft.Json.Linq;
using SkyNetz.FaleMais.DataAccess;

namespace SkyNetz.FaleMais.API.Controllers
{
    public class FaresController : Base
    {
        [HttpPost]
        [Route("api/fares/list")]
        public async Task<IHttpActionResult> Get([FromBody]string id)
        {
            int planId = int.Parse(id);
            Fares fare = await db.Fares.Where(f => f.PlanId == planId).FirstOrDefaultAsync();
            if (fare == null)
            {
                return NotFound();
            }

            return Json(fare);
        }
         
        [HttpPost]
        [Route("api/fares/calc")]
        public IHttpActionResult Calc([FromBody]string data)
        {
            var ayParams = data.Split('|');
            var planId = int.Parse(ayParams[0].ToString());
            var origin = int.Parse(ayParams[1].ToString());
            var destination = int.Parse(ayParams[2].ToString());
            var minutes = int.Parse(ayParams[3].ToString());
            Fares fare = db.Fares.ToList().Where(f => f.PlanId == planId && f.Origin == origin && f.Destination == destination).FirstOrDefault();
            var timebase = 0;

            if (minutes > fare.Time)
                timebase = minutes - fare.Time;

            var total = timebase * fare.UnitValue;

            if (fare == null)
            {
                return NotFound();
            }

            return Json(total);
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