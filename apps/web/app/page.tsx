import { client } from "@repo/db/client";

export default async function Home() {
  const user = await client.user.findFirst();
  return (
    <div>
      STAGING area Username: {user?.username}
      <br />
      Password: {user?.password}
    </div>
  );
}
