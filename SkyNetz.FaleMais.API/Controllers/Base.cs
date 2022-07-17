using SkyNetz.FaleMais.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;

namespace SkyNetz.FaleMais.API.Controllers
{
    public abstract class Base : ApiController
    {
        private FaleMaisContext _db = new FaleMaisContext();
        public FaleMaisContext db { get { return _db; } set { db = _db; } }

    }
}