namespace Zifmia.Model
{
    public enum ZifmiaRegistrationStatus
    {
        Succeeded = 0,
        UsernameExists = -1,
        NickNameExists = -2,
        EmailAddressExists = -3
    }
}
