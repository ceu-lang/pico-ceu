# Usart

A pico-Céu library to send and receive data using USART (Universal Synchronous and Asynchronous Receiver-Transmitter).
Windows-only for now.

## Includes

```c#
#include "usart.ceu"
```

## Initiate
```ceu
code/await Usart (var int portNumber) -> NEVER do
```

- Parameters:
    - `var int`: Serial port number to use.

- Example:
```ceu
spawn Usart(3);

```
Specify that we'll use the COM3 port.

## Send

### Usart_TX

Send a byte vector via serial.

```ceu
code/await Usart_TX (var&[] byte str) -> none do
```

- Parameters:
    - `var&[] byte`: the byte vector to send.

- Example: 
```ceu
spawn Usart(3);

var[5] byte str;
call String_Append_STR(&str, "send");

await Usart_TX(&str);

```
Create a string and send it via serial using ```Usart_TX```. Check [`String_Append_STR`](#https://ceu-lang.github.io/ceu/out/manual/v0.30/string/#string_append_str) to learn more string manipulation in Céu.

## Receive

### Usart_RX

```ceu
code/await Usart_RX (var&[] byte str, var int nbChar) -> none do
```
- Payload:
    - `var&[] byte`: byte vector to store the received data
    - `var int`: number of bytes to read

- Example: 
```ceu
spawn Usart(3);

var[5] byte buffer;
await Usart_RX(&buffer, 5);
String_Print(&buffer);

```
Receive a string of size 5 from serial port, counting the ```0```.


