export const idlFactory = ({ IDL }) => {
  const Note = IDL.Record({ 'title' : IDL.Text, 'content' : IDL.Text });
  return IDL.Service({
    'createNotes' : IDL.Func([IDL.Text, IDL.Text], [], ['oneway']),
    'getNotes' : IDL.Func([], [IDL.Vec(Note)], ['query']),
    'removeListNotes' : IDL.Func([IDL.Nat], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };
