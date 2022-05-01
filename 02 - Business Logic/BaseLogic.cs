using DoggyStyle;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DoggyStyle
{
    public class BaseLogic : IDisposable
    {
        protected readonly DoggyStyleEntities DB = new DoggyStyleEntities();

        public void Dispose()
        {
            DB.Dispose();
        }
    }
}
