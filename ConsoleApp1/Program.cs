// See https://aka.ms/new-console-template for more information




public class TopMaliciousReader
{
    public int IdStudent { get; set; }
    public double CoefMalicious { get; set; }
}


public class DtoBookAtStudent
{
    public int IdBook { get; set; }
    public int IdStudent { get; set; }
    public DateTime TakingBook { get; set; }
    public DateTime RefoundBook { get; set; }

}

public class Controller
{
    public double MaliciousReader(List<DtoBookAtStudent> bookAtStudents)
    {
        List<TopMaliciousReader> MaliciousReaders = new List<TopMaliciousReader>();
        List<DtoBookAtStudent> tmpBookAtStudent = new List<DtoBookAtStudent>();
        TopMaliciousReader topMaliciousReader = new TopMaliciousReader();

        foreach (var bS in bookAtStudents)
        {
            if (MaliciousReaders.Find(i => i.IdStudent == bS.IdStudent).IdStudent != bS.IdStudent)
            {
                tmpBookAtStudent = bookAtStudents.FindAll(item => item.IdStudent == bS.IdStudent);
                topMaliciousReader.IdStudent = bS.IdStudent;

                foreach (var tmpBS in tmpBookAtStudent)
                {
                    double diff = 0;
                    if (tmpBS.RefoundBook != null)
                    {
                        diff = (tmpBS.RefoundBook - tmpBS.TakingBook).TotalDays;
                    }
                    topMaliciousReader.CoefMalicious = topMaliciousReader.CoefMalicious + diff + 10;
                }
                MaliciousReaders.Add(topMaliciousReader);
            }
        }

        return MaliciousReaders.Max(topMaliciousReader => topMaliciousReader.CoefMalicious);
    }
}


