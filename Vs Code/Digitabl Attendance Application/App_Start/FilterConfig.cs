using System.Web;
using System.Web.Mvc;

namespace Digitabl_Attendance_Application
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
