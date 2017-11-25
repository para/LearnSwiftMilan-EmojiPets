# EmojiPets @ Learn Swift Milan

This project was part of a live coding session held at [Learn Swift Milan](https://www.meetup.com/it-IT/Learn-Swift-Milan/) meetup in November 2017, meant to illustrate the basics of [Vapor](https://vapor.codes/).

It's a demo implementation of a very simple backend API for managing `EmojiPet` objects, as represented in JSON format as follows:

```
{
	"name": "FailPanda",
	"emoji": "🐼"
}
```

![](https://media.giphy.com/media/xTk9ZRJytbejZGlzqg/giphy.gif)

The project was created using [Vapor v2.4.0](https://github.com/vapor/vapor/releases/tag/2.4.0).

## How to Build & Run

1. Install Vapor, as explained on its [getting started](https://docs.vapor.codes/2.0/getting-started/install-on-macos/) page
2. Build the project using `vapor build`
3. Run the server with `vapor run`

If you want to generate an Xcode project, you can use the `vapor xcode` command.

## How to Use

The REST API supports two endpoints:

* `GET /api/pets`: get the list of existing EmojiPets
* `POST /api/pets`: create a new EmojiPet

## Extra

The project includes an `emojipets.playground` file, that shows how to decode a JSON response containing a list of EmojiPets using Swift 4's [Codable](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types).