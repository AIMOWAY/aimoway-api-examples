# AIMOWAY API Examples

OpenAI-compatible API examples for AIMOWAY AI model access.

AIMOWAY provides OpenAI-compatible AI API access for developers, AI agent builders, students, small teams, and agent workflow users. Use the AIMOWAY `/v1` API with your API key, base URL, and supported model names.

This repository shows how to call AIMOWAY using `curl`, Python, Node.js, and OpenAI-compatible tooling.

## Quick links

| Resource                     | URL                                       |
|------------------------------|-------------------------------------------|
| Website                      | https://aimoway.com                       |
| Quick Start                  | https://aimoway.com/docs/quickstart       |
| AI Agents & Coding Agents    | https://aimoway.com/docs/ai-agents        |
| Developer Docs               | https://aimoway.com/docs                  |
| API Reference                | https://aimoway.com/docs/api-reference    |
| API Examples                 | https://aimoway.com/docs/examples         |
| Pricing                      | https://aimoway.com/pricing               |
| FAQ                          | https://aimoway.com/faq                   |
| OpenAI-Compatible API Access | https://aimoway.com/openai-compatible-api |
| GLM-5.2 API                  | https://aimoway.com/models/glm-5-2        |
| Privacy Policy               | https://aimoway.com/privacy               |

## Who this is for

AIMOWAY is designed for people who want straightforward access to selected AI models through a familiar OpenAI-compatible API.

Typical users include:

* Developers building AI features into apps, scripts, and backend services
* AI agent and AI coding agent users who need an OpenAI-compatible `/v1` endpoint
* Students learning how to call LLM APIs with `curl`, Python, or Node.js
* Small teams that want API keys, usage logs, clear pricing, and practical examples
* Builders experimenting with OpenAI-compatible tools and model routing

## What you get

AIMOWAY provides:

* OpenAI-compatible `/v1` API access
* API key based authentication
* Service-credit based billing
* Usage logs
* Model pricing information
* Developer documentation
* Public examples for `curl`, Python, and Node.js
* Agent workflow setup notes for tools such as OpenCode and Hermes Agent

AIMOWAY provides access to selected AI models through authorized service sources and upstream infrastructure. AIMOWAY is not a scraping layer or an unofficial shortcut to AI model services.

## Base URL

Use this OpenAI-compatible API base URL:

```text
https://aimoway.com/v1
```

## Before you start

Create an AIMOWAY account, add service credits, and create an API key.

Do not hard-code your API key in source code. Use an environment variable instead:

```bash
export AIMOWAY_API_KEY="your_aimoway_api_key_here"
```

## What is included

| Example | Location           | Description                      |
| ------- | ------------------ | -------------------------------- |
| `curl`  | This README        | Minimal Chat Completions request |
| Python  | `examples/python/` | OpenAI SDK example               |
| Node.js | `examples/node/`   | OpenAI SDK example               |

## Developer documentation

For the full AIMOWAY developer documentation, see:

* Developer Docs: https://aimoway.com/docs
* Quick Start: https://aimoway.com/docs/quickstart
* API Reference: https://aimoway.com/docs/api-reference
* API Examples: https://aimoway.com/docs/examples
* OpenCode configuration: https://aimoway.com/docs/opencode
* Hermes Agent configuration: https://aimoway.com/docs/hermes-agent
* Troubleshooting: https://aimoway.com/docs/troubleshooting

## Agent workflow notes

If you use AI coding tools or agent workflows, AIMOWAY can be used as an OpenAI-compatible endpoint when the tool supports custom API base URLs.

In general, you need:

```text
Base URL: https://aimoway.com/v1
API key:  your AIMOWAY API key
Model:    a supported model name from the AIMOWAY Pricing page
```

See:

* OpenCode configuration: https://aimoway.com/docs/opencode
* Hermes Agent configuration: https://aimoway.com/docs/hermes-agent
* Pricing and supported models: https://aimoway.com/pricing

## Example model

The examples below use:

```text
DeepSeek-V3.2
```

You can replace it with another supported model from the AIMOWAY Pricing page.

You can also try other supported models such as:

```text
GLM-5.2
```

For current model availability, context window notes, and pricing, see:

* Pricing: https://aimoway.com/pricing
* GLM-5.2 API: https://aimoway.com/models/glm-5-2

## curl example

```bash
curl https://aimoway.com/v1/chat/completions \
  -H "Authorization: Bearer $AIMOWAY_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "DeepSeek-V3.2",
    "messages": [
      {
        "role": "system",
        "content": "You are a concise and helpful assistant."
      },
      {
        "role": "user",
        "content": "Give me one practical idea for testing an LLM API."
      }
    ],
    "temperature": 0.2,
    "max_tokens": 128
  }'
```

## Python example

Install dependencies:

```bash
pip install -r examples/python/requirements.txt
```

Run the example:

```bash
python examples/python/chat_completions.py
```

The Python example uses the OpenAI SDK with the AIMOWAY API base URL:

```python
from openai import OpenAI
import os

client = OpenAI(
    api_key=os.environ["AIMOWAY_API_KEY"],
    base_url="https://aimoway.com/v1",
)

response = client.chat.completions.create(
    model="DeepSeek-V3.2",
    messages=[
        {"role": "system", "content": "You are a concise and helpful assistant."},
        {"role": "user", "content": "Give me one practical idea for testing an LLM API."},
    ],
    temperature=0.2,
    max_tokens=128,
)

print(response.choices[0].message.content)
```

## Node.js example

Install dependencies:

```bash
cd examples/node
npm install
```

Run the example:

```bash
npm start
```

The Node.js example uses the OpenAI SDK with the AIMOWAY API base URL:

```javascript
import OpenAI from "openai";

const client = new OpenAI({
  apiKey: process.env.AIMOWAY_API_KEY,
  baseURL: "https://aimoway.com/v1",
});

const response = await client.chat.completions.create({
  model: "DeepSeek-V3.2",
  messages: [
    {
      role: "system",
      content: "You are a concise and helpful assistant.",
    },
    {
      role: "user",
      content: "Give me one practical idea for testing an LLM API.",
    },
  ],
  temperature: 0.2,
  max_tokens: 128,
});

console.log(response.choices[0].message.content);
```

## Notes

AIMOWAY uses service credits.

Model usage is billed based on token consumption. Input and output token pricing may differ by model. See the Pricing page for the current supported model list and pricing.

AIMOWAY does not use customer prompts, outputs, uploaded files, API request content, or other customer work data to train AI models.

For more details, see:

* Pricing: https://aimoway.com/pricing
* FAQ: https://aimoway.com/faq
* Privacy Policy: https://aimoway.com/privacy

## Security

Never commit API keys, tokens, `.env` files, logs, or request data that may contain private information.

Recommended local environment file pattern:

```bash
# .env
AIMOWAY_API_KEY="your_aimoway_api_key_here"
```

If you use a `.env` file, make sure it is ignored by Git:

```gitignore
.env
.env.*
!.env.example
```

## Troubleshooting

| Problem                | Possible cause                       | Suggested check                                  |
| ---------------------- | ------------------------------------ | ------------------------------------------------ |
| `401 Unauthorized`     | Missing or invalid API key           | Confirm `AIMOWAY_API_KEY` is set correctly       |
| `404 Not Found`        | Wrong API base URL or endpoint       | Use `https://aimoway.com/v1`                     |
| Model error            | Unsupported or misspelled model name | Check the current model list on the Pricing page |
| Quota or billing error | Insufficient service credits         | Check your AIMOWAY account balance               |

For more troubleshooting notes, see:

https://aimoway.com/docs/troubleshooting

## License

MIT
