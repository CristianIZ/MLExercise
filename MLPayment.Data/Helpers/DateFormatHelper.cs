using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MLPayment.Data.Helpers
{
    public static class DateFormatHelper
    {
        /// <summary>
        /// Converts a datetime in an int with YYYYMMDD format
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static int DateToIntFormat(DateTime date)
        {
            string month;
            string day;

            if (date.Month < 10)
                month = $"0{date.Month}";
            else
                month = date.Month.ToString();

            if (date.Day < 10)
                day = $"0{date.Day}";
            else
                day = date.Day.ToString();

            return Convert.ToInt32($"{date.Year}{month}{day}");
        }

        /// <summary>
        /// Returns the same date but with the first day of the month
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static int FirstDayMonth(DateTime date)
        {
            string month;

            if (date.Month < 10)
                month = $"0{date.Month}";
            else
                month = date.Month.ToString();

            return Convert.ToInt32($"{date.Year}{month}01");
        }

        /// <summary>
        /// Returns the same date but with the last day of the month
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static int LastDayMonth(DateTime date)
        {
            string month;

            if (date.Month < 10)
                month = $"0{date.Month}";
            else
                month = date.Month.ToString();

            return Convert.ToInt32($"{date.Year}{month}{DateTime.DaysInMonth(date.Year, date.Month)}");
        }
    }
}
