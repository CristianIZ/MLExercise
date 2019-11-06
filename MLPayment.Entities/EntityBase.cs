using System;
using System.Linq;
using System.ComponentModel;
using System.Runtime.Serialization;

namespace MLPayment.Entities
{
    [Serializable]
    [DataContract]
    public abstract class EntityBase : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        public void NotifyPropertyChanged(string propertyName)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }

        public override string ToString()
        {
            return this.GetType().Name + ": " +
                string.Join("|", this.GetType().GetProperties()
                .Where(p => !p.PropertyType.IsGenericType && !p.PropertyType.IsArray)
                .Select(p => string.Format("{0}={1}", p.Name, p.GetValue(this, null))));
        }

        [DataMember]
        [DisplayName("DateIndex")]
        public int DateIndex { get; set; }

        [DataMember]
        [DisplayName("DateCreation")]
        public DateTime DateCreation { get; set; }

        [DataMember]
        [DisplayName("DateModification")]
        public DateTime? DateModification { get; set; }

        [DataMember]
        [DisplayName("Valid")]
        public bool Valid { get; set; }
    }
}
