package lighthon.dto.members;

public class CompactMemberInfoDTO {
    private String nick;
    private String file;

    public CompactMemberInfoDTO(String nick, String file) {
        this.nick = nick;
        this.file = file;
    }

    public String getNick() {
        return nick;
    }

    public String getFile() {
        return file;
    }
}
