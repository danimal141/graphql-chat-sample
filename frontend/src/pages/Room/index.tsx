import React, { useMemo, useState, useEffect } from "react";
import { RouteComponentProps } from "react-router-dom";
import { useQuery, useMutation, useSubscription } from "@apollo/client";
import {
  RoomDocument,
  PostMessageDocument,
  Message,
  MessageWasAddedDocument,
} from "../../graphql/generated";

type RoomProps = {} & RouteComponentProps<{ name: string }>;

const Room: React.FC<RoomProps> = ({ match }: RoomProps) => {
  const { params } = match;
  const [textInput, setTextInput] = useState<string>("");
  const [messages, setMessages] = useState<string[]>([]);

  const { data, loading } = useQuery(RoomDocument, {
    variables: { name: params.name },
  });

  const [postMessage] = useMutation(PostMessageDocument, {
    variables: { input: { message: textInput, room: params.name } },
    onCompleted: () => {
      setTextInput("");
    },
  });
  const handleInputChange = (val: string) => {
    setTextInput(val);
  };
  const handleClick = () => {
    postMessage();
  };

  const messageWasAdded = useSubscription(MessageWasAddedDocument);
  useEffect(() => {
    const newMessage = messageWasAdded.data?.messageWasAdded.message;
    if (!newMessage) {
      return;
    }
    setMessages((oldMessages) => [...oldMessages, newMessage]);
  }, [messageWasAdded.data?.messageWasAdded]);

  useMemo(() => {
    if (data == null) {
      return;
    }
    setMessages(data.room.messages.map((mes: Message) => mes.body));
  }, [data]);

  if (loading) return <p>Loading...</p>;

  return (
    <>
      <h1>Room: {params.name}</h1>
      <div>
        <h2>Messages</h2>
        <ul>
          {messages.map((mes: string, id: number) => (
            <li key={id}>{mes}</li>
          ))}
        </ul>
      </div>
      <div>
        <input
          type="text"
          value={textInput}
          onChange={(e) => handleInputChange(e.target.value)}
        />
      </div>
      <div>
        <button onClick={handleClick}>Post!</button>
      </div>
    </>
  );
};

export default Room;
