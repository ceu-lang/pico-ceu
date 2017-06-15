# Network

Provides unreliable broadcast communication between peers.

## Send

### NET_SEND

Broadcasts a message to all peers.

```ceu
output (integer,text) NET_SEND;
```

- Parameters:
    - `integer`: number of bytes to transmit
    - `byte&&`: stream of bytes

## Receive

### NET_RECEIVE

Receives all messages from all peers, including itself.

```ceu
input (integer,byte&&) NET_RECEIVE;
```

- Occurrences:
    - on every received message
- Payload:
    - `integer`: number of received bytes
    - `byte&&`: stream of bytes
