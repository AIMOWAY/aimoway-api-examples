import os
from openai import OpenAI


def main() -> None:
    api_key = os.environ.get("AIMOWAY_API_KEY")
    if not api_key:
        raise RuntimeError(
            "AIMOWAY_API_KEY is not set. "
            "Run: export AIMOWAY_API_KEY='your_aimoway_api_key_here'"
        )

    client = OpenAI(
        api_key=api_key,
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


if __name__ == "__main__":
    main()
