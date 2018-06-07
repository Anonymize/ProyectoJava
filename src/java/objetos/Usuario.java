package objetos;


public class Usuario {
    private int Id;
    private String User;
    private String Pass;
    private String Name;
    private String LastName;
    private String Sexo;
    private String Direccion;
    private String Correo;

    public Usuario(int Id, String User, String Pass, String Name, String LastName, String Sexo, String Direccion, String Correo) {
        this.Id = Id;
        this.User = User;
        this.Pass = Pass;
        this.Name = Name;
        this.LastName = LastName;
        this.Sexo = Sexo;
        this.Direccion = Direccion;
        this.Correo = Correo;
    }

    public int getId() {
        return Id;
    }

    public String getUser() {
        return User;
    }

    public String getPass() {
        return Pass;
    }

    public String getName() {
        return Name;
    }

    public String getLastName() {
        return LastName;
    }

    public String getSexo() {
        return Sexo;
    }

    public String getDireccion() {
        return Direccion;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public void setUser(String User) {
        this.User = User;
    }

    public void setPass(String Pass) {
        this.Pass = Pass;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public void setSexo(String Sexo) {
        this.Sexo = Sexo;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }
    
    
}
