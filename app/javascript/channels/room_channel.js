import consumer from './consumer';

// consumer.subscriptions.create("RoomChannel", {
const roomChannel = consumer.subscriptions.create(
  { channel: 'RoomChannel', room: 1 },
  {
    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      // data => { sent_by: "Paul", body: "This is a cool chat app." }
    },
  }
);

roomChannel.send({ sent_by: 'Paul', body: 'This is a cool chat app.' });
