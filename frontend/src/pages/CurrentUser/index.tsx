import React from "react";
import { CurrentUserDocument } from "../../graphql/generated";
import { useQuery } from "@apollo/client";
import LogoutButton from "../../components/LogoutButton";
// import { useAuth0 } from "@auth0/auth0-react"

const CurrentUser: React.FC = () => {
  // const { user, isAuthenticated, getAccessTokenSilently } = useAuth0();
  // const [userMetadata, setUserMetadata] = useState(null);
  const { data } = useQuery(CurrentUserDocument);
  // const { user } = useAuth0();
  return (
    <>
      Current User!
      <p>data: {JSON.stringify(data)}</p>
      <LogoutButton />
    </>
  );
};

export default CurrentUser;
