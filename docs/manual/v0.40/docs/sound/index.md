# Sound

Provides sound playback.

## Configuration

### SOUND_SET_VOLUME

Changes the volume of all subsequent sound playbacks.

```ceu
output (integer) SOUND_SET_VOUME
```

- Parameters:
    - `integer`: new sound volume in percentage (from `0` to `100`)


## Playback

### SOUND_PLAY

Plays a sound file.

```ceu
output (text) SOUND_PLAY
```

- Parameters:
    - `text`: path for the sound filename

The playback volume is specified with [`SOUND_SET_VOLUME`](#sound_set_volume).
