import OpenAI from "openai";

if (!process.env.AIMOWAY_API_KEY) {
  console.error("Error: AIMOWAY_API_KEY is not set.");
  console.error("Run: export AIMOWAY_API_KEY='your_aimoway_api_key_here'");
  process.exit(1);
}

const client = new OpenAI({
  apiKey: process.env.AIMOWAY_API_KEY,
  baseURL: "https://aimoway.com/v1",
});

const response = await client.chat.completions.create({
  model: "DeepSeek-V3.2",
  messages: [
    { role: "system", content: "You are a concise and helpful assistant." },
    { role: "user", content: "Give me one practical idea for testing an LLM API." },
  ],
  temperature: 0.2,
  max_tokens: 128,
});

console.log(response.choices[0].message.content);
