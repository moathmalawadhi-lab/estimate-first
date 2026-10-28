---
name: estimate-first
description: Use before starting ANY task the user asks for (code, files, research, writing, design, analysis). First give a rough estimate of time, tokens and usage, then ask the user to approve or reject, and do not start work until they approve.
---

# Estimate First — قدّر أولاً

Before doing any work on a request, stop and give the user a short estimate card, then wait for their decision.

## When to apply
- Apply to every request that needs real work: tool calls, reading files, web searches, writing code, building files, long answers.
- Skip only for greetings, thanks, or a one-line factual answer that costs almost nothing.
- Do not apply again when the user has just approved the plan, or when they say "skip estimate" / "بدون تقدير".

## Step 1 — Plan silently
Break the request into steps and count the work:
- How many files to read, and roughly how big.
- How many web searches / page fetches.
- How many files or lines to write.
- How many tool calls and test runs.

Do NOT start any of these steps yet. Planning is thinking only, no tool calls (except a very quick look at the folder size if that is the only way to estimate).

## Step 2 — Estimate with these rules of thumb
Tokens (1 token ≈ 4 English characters ≈ 2–3 Arabic characters):

| Action | Approx. tokens |
|---|---|
| Each tool call overhead | 300–800 |
| Reading a small file (<200 lines) | 1,000–3,000 |
| Reading a large file (1,000+ lines) | 10,000–40,000 |
| One web search + reading results | 3,000–8,000 |
| Fetching one web page | 4,000–15,000 |
| Writing 100 lines of code | 1,500–2,500 (output) |
| A one-page document | 800–1,500 (output) |
| Running tests / a build and reading output | 2,000–10,000 |
| Each fix-and-retry cycle | +20–40% of the step |

Remember: every step re-reads the conversation so far, so total input grows with the number of steps. Add 30–50% on top of the sum for long multi-step tasks.

Time (wall-clock, approximate):
- Each tool call: 3–15 seconds.
- Each web search: 5–20 seconds.
- Writing output: about 1 minute per 1,500–3,000 output tokens.
- Builds, installs, tests: 30 seconds to several minutes.

Usage level (share of the user's plan limit):
- Low: under ~50K tokens total.
- Medium: ~50K–250K tokens.
- High: ~250K–1M tokens.
- Very high: above ~1M tokens — warn clearly.

Always give a range (low–high), never a single exact number. Be honest that it is an estimate.

## Step 3 — Show the estimate card
Reply in the user's language. Keep it short. Format:

```
📋 تقدير المهمة
المهمة: <one line>
الخطوات: <3–6 short steps>
⏱️ الوقت المتوقع: <range, e.g. 3–6 دقائق>
🔢 التوكنز التقريبية: <range, e.g. 40K–80K>
📊 الاستهلاك: <منخفض / متوسط / عالي / عالي جداً>
⚠️ ملاحظة: <only if something could make it bigger, e.g. unknown file size>
```

(English version: Task / Steps / Estimated time / Approx. tokens / Usage level / Note.)

If a cheaper approach exists, offer it as a second option with its own estimate (e.g. "نسخة مختصرة: 1–2 دقيقة، ~15K توكن").

## Step 4 — Ask for approval
- If an `AskUserQuestion` tool is available, use it with options: "موافق، ابدأ" / "نسخة مختصرة" (if offered) / "رفض".
- Otherwise end the message with: "توافق أبدأ؟ (نعم / لا / مختصر)".
- Then STOP. Do not start any step until the user approves.

## Step 5 — After the decision
- Approved → do the task normally.
- Rejected → do nothing and ask if they want to change the scope.
- Mid-task, if the real usage is clearly going to exceed the high end of the estimate by more than ~50%, pause and tell the user with a new estimate before continuing.
- At the end, add one line: "⏱️ الفعلي تقريباً: <time>، <tokens>" so the user can compare.
