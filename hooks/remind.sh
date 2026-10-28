#!/usr/bin/env bash
# Runs on every prompt in Claude Code. Whatever this prints is added to Claude's context.
# Turn off temporarily with:  export ESTIMATE_FIRST_OFF=1

input="$(cat)"

if [ "${ESTIMATE_FIRST_OFF:-0}" = "1" ]; then
  exit 0
fi

# Let the user skip by writing "skip estimate" or "بدون تقدير" in the prompt.
if printf '%s' "$input" | grep -qiE 'skip estimate|بدون تقدير'; then
  exit 0
fi

cat <<'EOF'
[estimate-first] Before doing any work on this request, follow the estimate-first skill:
give a short estimate card (steps, time range, token range, usage level) in the user's language,
ask the user to approve or reject, and do not start any tool work until they approve.
Skip this only for greetings, thanks, a trivial one-line answer, or a reply that is the user's approval of an estimate you already gave.
EOF
exit 0
