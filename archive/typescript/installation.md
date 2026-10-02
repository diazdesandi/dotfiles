# TypeScript Installation

1. Install TypeScript

    ```sh
    pnpm add -D ts-node typescript
    ```

2. Install TSX

    ```sh
    pnpm add -D tsx
    ```

3. Create a `tsconfig.json` file

    ```json
    {
      "compilerOptions": {
        "target": "ES2024",
        "module": "NodeNext",
        "strict": true,
        "esModuleInterop": true,
        "skipLibCheck": true,
        "forceConsistentCasingInFileNames": true
      }
    }
    ```

4. Run your TypeScript files using TSX

    ```sh
    tsx <file>.ts
    ```