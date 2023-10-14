import Text "mo:base/Text";
import None "mo:base/None";
import List "mo:base/List";
import Debug "mo:base/Debug";


actor Dkeeper{
  type Note={
    title:Text;
    content:Text;
  };

  stable var notes:List.List<Note> = List.nil<Note>();

  public func createNotes(title:Text,content:Text){

let newNote:Note={
  title=title;
  content=content;
};
notes:=List.push(newNote,notes);
Debug.print(debug_show(newNote))
  };

public query func getNotes():async [Note]{
    return List.toArray(notes)
};

public func removeListNotes(id:Nat){

  let list1=List.take(notes,id);
  let list2=List.drop(notes,(id+1));

  notes:=List.append(list1,list2);
  
}

}
