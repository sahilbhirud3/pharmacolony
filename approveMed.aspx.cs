using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MongoDB.Bson;
using MongoDB.Driver;

namespace pharmacolony
{
    class SGATable
    {
        public ObjectId _id { get; set; }
        public string name { get; set; }
        public string licno { get; set; }
        public string fname { get; set; }
        public string lname { get; set; }

        public string email { get; set; }
        public string contact { get; set; }
        public string address { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string password { get; set; }
        public string status { get; set; }

    }
    public partial class approveMed : System.Web.UI.Page
    {
        protected  void Page_Load(object sender, EventArgs e)
        {


            var client = new MongoClient("mongodb+srv://pharmacolony:pharmadb123@pharmacolony.ywbv8.mongodb.net/test");
            var database = client.GetDatabase("pharmacolony");
            var collection = database.GetCollection<BsonDocument>("medical");
            var filter = Builders<BsonDocument>.Filter.Eq("status", 1);

            var result = collection.Find<BsonDocument>(filter).FirstOrDefault();

            Label2.Text = result.ToString();




            // var client = new MongoClient("mongodb+srv://pharmacolony:pharmadb123@pharmacolony.ywbv8.mongodb.net/test");
            //var database = client.GetDatabase("pharmacolony");
            //var collection = database.GetCollection<BsonDocument>("medical");
            //var filter = Builders<BsonDocument>.Filter.Eq("status", 1);
            //MongoCursor<BsonDocument> cursor = (MongoCursor<BsonDocument>)collection.Find(filter);

            //DataTable dt = new DataTable();
            //dt.Columns.Add("_id", typeof(MongoDB.Bson.ObjectId));
            //dt.Columns.Add("licno", typeof(string));
            //dt.Columns.Add("name", typeof(string));
            //dt.Columns.Add("fname", typeof(string));
            //dt.Columns.Add("lname", typeof(string));
            //dt.Columns.Add("email", typeof(string));
            //dt.Columns.Add("contact", typeof(string));
            //dt.Columns.Add("address", typeof(string));
            //dt.Columns.Add("city", typeof(string));
            //dt.Columns.Add("state", typeof(string));
            //dt.Columns.Add("status", typeof(int));

            //foreach (var item in cursor)
            //{
            //    dt.Rows.Add(item["_id"], item["licno"], item["name"], item["fname"], item["lname"],
            //        item["email"], item["contact"], item["address"], item["city"], item["state"]
            //        , item["status"]);
            //}

            //grid1.DataSource = dt;
        }
    }
}