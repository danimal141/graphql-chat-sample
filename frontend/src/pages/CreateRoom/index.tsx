import React, { useState } from "react";
import { CreateRoomDocument } from "../../graphql/generated";
import { useMutation } from "@apollo/client";

const CreateRoom: React.FC = () => {
  const [textInput, setTextInput] = useState<string>("");

  const [createRoom] = useMutation(CreateRoomDocument, {
    variables: { input: { name: textInput } },
    onCompleted: (data) => {
      console.log(data);
    },
  });
  const handleInputChange = (val: string) => {
    setTextInput(val);
  };
  const handleClick = () => createRoom();

  return (
    <>
      <div>
        <p>Room</p>
        <input
          type="text"
          onChange={(e) => handleInputChange(e.target.value)}
        />
      </div>
      <div>
        <button onClick={handleClick}>Create!</button>
      </div>
    </>
  );
};

export default CreateRoom;
